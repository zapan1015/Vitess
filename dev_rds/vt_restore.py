import os
import pymysql

VT_RDS_USER = os.environ.get("VT_RDS_USER")
VT_RDS_PWD = os.environ.get("VT_RDS_PWD")

conn = pymysql.connect(
    user=VT_RDS_USER,
    passwd=VT_RDS_PWD,
    host='test-soohyun-vitess.cluster-clbz1hjlobpr.ap-northeast-2.rds.amazonaws.com',
    charset='utf8'
)

print("USER: {0}".format(VT_RDS_USER))
