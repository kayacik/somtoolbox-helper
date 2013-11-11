#!/usr/bin/env python
#
# Python code takes data from stdin that is comma separated
# and produces a file that can be loaded with som_toolbox.
# It allows you to select the columns that are labels. 
# You can supply a header or use the first line of the stdin data.
#

#
#
#
def process_row(token, labelcol, osep):
	count = 0
	record = ''
	for i in xrange(0, len(token)):
		if i not in labelcols:
			count +=1
			if count == 1:
				record += token[i]
			else:
				record += osep + token[i]
	for i in xrange(0, len(token)):
		if i in labelcols:
			count +=1
			if count == 1:
				record += token[i]
			else:
				record += osep + token[i]
	return record

import sys
import datetime
from optparse import OptionParser

parser = OptionParser()
parser.add_option("--cols", dest="cols",
                  help="A list of columns that are labels. E.g. '1,2,3,7'. Index starts from 1 ", default="")
parser.add_option("--header-str", dest="headerstr",
                  help="A list of columns that are column labels. E.g. 'IP,Date,Bytes,Packets'. ", default=None)
parser.add_option("--no-header",
                  action="store_false", dest="has_header", default=True,
                  help="Don't use the first column as header")
(option, args) = parser.parse_args()


fh = sys.stdin
sep = ","
osep = "\t"
line = fh.readline().rstrip('\n')
linecount = 0L

labelcols = [] 

while line:
	linecount += 1
	token = line.split(sep)
	if linecount == 1:
		# Process header and  labelcols
		for l in option.cols.split(','):
			if int(l) < len(token) and int(l) > 0:
				labelcols.append(int(l)-1) # fix 1 index to 0 index here
		print len(token) - len(labelcols)	
		header = '#n'
		if option.has_header is True:
			for i in xrange(0, len(token)):
				if i not in labelcols:
					header += osep + token[i]
			header += '\n#l'
			for i in xrange(0, len(token)):
				if i in labelcols:
					header += osep + token[i]
			print header
		else:
			for i in xrange(0, len(token)):
				if i not in labelcols:
					header += osep + 'col' + str(i)
			header += '\n#l'
			for i in xrange(0, len(token)):
				if i in labelcols:
					header += osep + 'col' + str(i)
			print header
			print process_row(token, labelcols, osep)
	else:
		# regular record
		print process_row(token, labelcols, osep)
	line = fh.readline().rstrip('\n')		