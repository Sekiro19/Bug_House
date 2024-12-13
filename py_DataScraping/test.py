import pandas as pd
import re
import requests
import base64

df = pd.read_csv(r'QueryResults_SQL.csv')
html = df[df['Q_Id'] == 982568].loc[:, 'A_Body'].to_list()[0]

matches = re.findall(pattern=r'<img src="(.+?)"', string=html)
byte_img = [base64.b64encode(requests.get(match).content) for match in matches]
for img in byte_img:
    html = re.sub(pattern=r'<img src="(.+)"', repl='<IMG src="data:image/png;base64,'+img.decode('utf-8')+'"', string=html)

with open(r'html_file.html', mode='w', encoding='utf-8') as body:
    body.write(html)