#!/bin/bash
#ab -n3000 -c100 -C'prouserid=34' -C'prousername=whhh' -C'sundxshop=username=7a57a5a743894a0e' 'http://fun.51fanli.com/goshop/go?shopid=450&gourl=&tcode=000113&d='
#ab -n3000 -c100 -C'prouserid=34' -C'prousername=whhh' -C'sundxshop=username=7a57a5a743894a0e' 'http://www.51fanli.com/goshop.asp?shopid=450'
ab -n10000 -c100 'http://fun.51fanli.com/chkname.asp?action=chkname&name=adfadf&1334477124734&jsoncallback=jQuery171003546102016998587_1334477117807&_=1334477124737'

