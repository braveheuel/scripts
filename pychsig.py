#!/usr/bin/env python
# -*- coding: UTF-8 -*-
#
#
#
from optparse import OptionParser

def greeting(code):
    if (code==1):
        res = "Mit freundlichen Grüßen/Best Regards\n"
    else:
        res = "Viele Grüße"
    res += "\nChristoph Heuel\n"
    return res

def contactOptions(code, mail):
    res = "+"+"-"*74+"+\n"
    res += fillLine("E-Mail: "+mail)
    if (code=="allg"):
        res += fillLine("Mobile: +49 (177) 4243715")
    elif (code=="tudo"):
        res += fillLine("Mobile: +49 (177) 4243715")
    res += "+"+"-"*74+"+\n"
    res += fillLine("Public-PGP-Key: http://www.heuel-web.de/ch_pub_key_2013.asc")
    res += "+"+"-"*74+"+"


    return res

def fillLine(text, l=76):
    pad = " "*(l-len(text)-3)+"|\n"
    res = "| "+text+pad
    return res

def main():
    parser = OptionParser()
    parser.add_option("-m", "--mail", dest="mail",
                      help="E-Mail-Address for signature"
                      , metavar="MAIL", default="christoph@heuel-web.de")

    parser.add_option("-s", "--sig", dest="sig",
                      help="Type of signature"
                      , metavar="SIG", default="allg")

    (options, args) = parser.parse_args()

    print greeting(1)
    print contactOptions(options.sig, options.mail)


if __name__ == '__main__':
    main()
