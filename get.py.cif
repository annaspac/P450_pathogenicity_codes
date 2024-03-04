#!/usr/bin/env pythondista(
# coding: utf-8

# In[91]:


from xml.dom import minidom
import xml.dom.minidom
from xml.dom.minidom import parse, parseString
import xml.etree.ElementTree as et
import os
import seaborn as sns
import numpy as np
from zipfile import ZipFile
from pathlib import Path


d = ['A0A087X1C5', 'O15528', 'O43174', 'O75881', 'P04798', 'P05093', 'P05108', 'P05177', 'P05181', 'P08684', 'P08686', 'P10632', 'P10635', 'P11509', 'P11511', 'P11712', 'P13584', 'P15538', 'P19099', 'P20813', 'P20815', 'P20853', 'P22680', 'P24462', 'P24557', 'P24903', 'P33260', 'P33261', 'P51589', 'P78329', 'P98187', 'Q02318', 'Q02928', 'Q07973', 'Q08477', 'Q16647', 'Q16678', 'Q16696', 'Q16850', 'Q4G0S4', 'Q5TCH4', 'Q6NT55', 'Q6V0L0', 'Q6VVX0', 'Q6ZWL3', 'Q7Z449', 'Q86W10', 'Q8TAV3', 'Q96SQ9', 'Q9HB55', 'Q9HBI6', 'Q9HCS2', 'Q9NR63', 'Q9NYL5', 'Q9UNU6', 'Q9Y6A2', 'Q8N118', 'Q6UW02', 'Q8N1L4', 'Q6ZSU1']

l = 0
for i in d:
    try:
       os.system(f'wget https://alphafill.eu/v1/aff/{i}')
    except:
        print(l)
        l+=1

