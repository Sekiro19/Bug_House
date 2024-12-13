import os
import random
import base64
import requests
import pandas as pd
import numpy as np
import re
from py_db_connection import cursor


def Fix_tags(tags):
    s = 'delphi'
    if '<sql-server>' in tags:
        s += ',sql-server'
    if '<python>' in tags:
        s += ',python'
    if '<c>' in tags:
        s += ',c'
    if '<c++>' in tags:
        s += ',c++'
    if '<c#>' in tags:
        s += ',c#'
    return s


df_Posts = pd.read_csv('QueryResults_delphi.csv').iloc[:1000, :]
df_Posts['Q_Tags'] = df_Posts['Q_Tags'].apply(Fix_tags)

print(df_Posts[df_Posts['A_Body'].str.contains(r'<img src="(.+?)"')])

def html_to_file(html: str):
    try:
        matches = re.findall(pattern=r'<img src="(.+?)"', string=html)
        byte_img = [base64.b64encode(requests.get(match).content) for match in matches]
        for img in byte_img:
            html = re.sub(pattern=r'<img src="(.+)"', repl='<IMG src="data:image/png;base64,' + img.decode('utf-8') + '"', string=html, count=1)
        with open(os.getcwd()+r'\BodyFiles\BODY.html', mode='w', encoding='UTF-8') as BODY:
            BODY.write(html)
    except Exception as e:
        print(e)
        raise e

def InsertData(row):
    html_to_file(row['Q_Body'])
    row['Q_Body'] = os.getcwd()+r'\BodyFiles\BODY.html'
    Data_Q = row.iloc[:5].to_list()
    SendIt_Q = '''EXEC MassInsert_AdminOnly  @UserId = 56,
                                        @PostId = ?,
                                        @PostTypeId = ?,
                                        @ParentId = -1,
                                        @Title = ?,
                                        @BodyFileDir = ?,
                                        @Tags = ?'''
    try:
        cursor.execute(SendIt_Q, Data_Q)
    except Exception as e:
        cursor.rollback()
        print(e)
        raise e
    else:
        cursor.commit()
    ######################################################
    html_to_file(row['A_Body'])
    row['A_Body'] = os.getcwd() + r'\BodyFiles\BODY.html'
    Data_A = row.iloc[5:].to_list()
    SendIt_A = '''EXEC MassInsert_AdminOnly @UserId = 56,
                                            @PostId = ?,
                                            @PostTypeId = ?,
                                            @ParentId = ?,
                                            @Title = '',
                                            @BodyFileDir = ?,
                                            @Tags = ''
                                            '''
    try:
        cursor.execute(SendIt_A, Data_A)
    except Exception as e:
        cursor.rollback()
        print(e)
        raise e
    else:
        cursor.commit()


# df_Posts.apply(InsertData, axis=1)

# def insert_User(val):
#     pfp = r'...img\dp_img\\'+random.choice(os.listdir(r'img\dp_img'))
#     SendIt = '''
#                 EXEC InsertUserData @DisplayName = ?,
#                                     @Password = ?,
#                                     @Tags = ?,
#                                     @ProfileImageUrl = ?
#                 '''
#
#     val = val.to_list()
#     val.append(pfp)
#     try:
#         cursor.execute(SendIt, val)
#     except Exception as e:
#         cursor.rollback()
#         print(e)
#         raise e
#     else:
#         cursor.commit()
#
#
# df_users = pd.read_csv('Query_Users.csv')
# df_users['Password'] = 
# df_users['Tags'] = 'sql-server,delphi'
# # df_users.apply(insert_User, axis=1)
#
# # for i in range(175, 275):
# #     cursor.execute(r'DELETE Users WHERE UserId = ?', [i])
# #     cursor.commit()

