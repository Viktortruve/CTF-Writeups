
'''import xml.etree.ElementTree as ET
mytree = ET.parse(\\\\\\\'copy_n_paste.svg\\\\\\\')
myroot = mytree.getroot()
tag = myroot.tag
'''
'''
count = 0
for x in myroot[1][2]:
    count += 1
    print(x.keys())
    
print(count)
'''

from xml.dom import minidom
p1 = minidom.parse("copy_n_paste.svg")

tagname = p1.getElementsByTagName('g')

full_string = ""
for tag in tagname:
    child = tag.firstChild
    base64 = child.firstChild.nodeValue
    print(base64)
    full_string = full_string.join(base64)


