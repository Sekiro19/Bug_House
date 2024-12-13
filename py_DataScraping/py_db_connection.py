import pyodbc, sys
import ctypes
import socket
connString = 'Driver={SQL Server Native Client 11.0};'\
              'Server=;'\
              'Database=BH;'\
              'Trusted_Connection=yes;'
# IP = socket.gethostbyname()  # IP adress of host computer
# connString = 'Driver={SQL Server Native Client 11.0};'\
#                         f'Server={IP};'\
#                         'Database=;'\
#                         'UID=;'\
#                         'PWD=;'\
#                         'Trusted_Connection=no;'

result = 4
while result == 4:
	try:
		conn = pyodbc.connect(connString)
	except Exception as e:
		print('DATABASE-Connection failed !!!\n', e)
		result = ctypes.windll.user32.MessageBoxW(0, f"Vérifier votre: \n --> connection aux server \n --> UserID \n --> Password", u"DATABASE-Connection failed !!!", 5 | 0x10)
		if result == 2: sys.exit()
	else:
		cursor = conn.cursor()
		result = True

