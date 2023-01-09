from django.db import connection

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"

    columns = [col[0] for col in cursor.description]
    result = cursor.fetchall()
    dict_result = {key:[] for key in columns}
    for row in result:
        tmp = zip(columns, row)
        for key, value in tmp:
            dict_result[key].append(value)

    return dict_result

def dictfetchall_procedure(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [dict(zip(columns, row)) for row in cursor.fetchall()]

def Procedure(name, *param):
    try:
        # close_old_connections()
        cursor = connection.cursor()
        str_param = ''
        for i, v in enumerate(param):
            str_param += "'" + str(v) + "'"

            if i < (len(param)-1):
                str_param += ", "
        
        sql = f"CALL {name}({str_param});"
        cursor.execute(sql)
        result = dictfetchall_procedure(cursor)

    except Exception as e:
        return False, str(e)
    finally:
        cursor.close()

    return True, result


def Sql(sql):
    try:
        # close_old_connections()
        cursor = connection.cursor()
        cursor.execute(sql)
        result = dictfetchall(cursor)

    except Exception as e:
        return False, str(e)
    finally:
        cursor.close()

    return True, result