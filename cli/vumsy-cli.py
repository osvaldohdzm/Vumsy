from art import *
import argparse
import locale
import json
import json
import logging
import os
import os.path
import pdb
import sys
from datetime import datetime, timedelta
from inspect import getmembers
from os.path import abspath

import sys
sys.path.append('../')
from vumsy_reporting import  *

def main():
    Art=text2art("vurmsy")
    print(Art)
    print("By Osvaldo HM in TIC DEFENSE")
    print("Starting the Vulnerability Reports Management System...\n")

    dn = os.path.dirname(os.path.abspath(sys.argv[0]))
    dt_string = datetime.now().strftime("%d-%m-%Y %H-%M-%S")
    logging.basicConfig(filename=os.path.join(dn,"logs","script.log".format(dt_string)), level=logging.DEBUG)
    logger = logging.getLogger(__name__)
    visible_mode_win32com = True
    
    parser = argparse.ArgumentParser(description='Web vulnerabilities report generator.')
    parser.add_argument("-j", help='JSON file path', required=True)
    args = vars(parser.parse_args())
    analysis_filename = args['j']
    print("Generating report files for {}...\n".format(analysis_filename))
    
    # Opening JSON file
    with open(analysis_filename, encoding='utf-8') as json_file:
        data = json.load(json_file)
        generate_report(data, visible_mode_win32com =  True, outputs_directory = os.path.join(dn,"outputs"), tmp_directory = os.path.join(dn,"temporary"))

    print("Report files generation successful!")
    
if __name__ == "__main__":
    main()
    
