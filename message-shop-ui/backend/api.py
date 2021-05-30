import json
from flask import Flask, request, Response
app = Flask(__name__)
from sqlalchemy import create_engine



class Database:
    engine = create_engine('postgresql://postgres:postgres@localhost:5432/message_shop')

    def __init__(self):
        with Database.engine.connect() as connection:
            with open('SQL_CREATE_TABLE.json', 'r') as j:
                json_tables = json.load(j)
            for create_table in json_tables.values():
                connection.execute(create_table)
            with open('SQL_TABLE_DATA.json', 'r') as j:
                json_data = json.load(j)
            for insert_data in json_data.values():
                connection.execute(insert_data)
            with open('SQL_SELECTS.json', 'r') as j:
                json_selects = json.load(j)
            self.dict_of_selects = json_selects


    def insert_into_database(self):
        with Database.engine.connect() as connection:
            connection.execute("INSERT QUERY")

    def drop_database(self):
        Database.engine.connect().execute("DROP SCHEMA public CASCADE; CREATE SCHEMA public;")


@app.route('/author-role/1')
def author_role_1():
    author = request.args['author']
    min_quantity = request.args['min_quantity']
    start = request.args['start']
    end = request.args['end']

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select1"].format(author=author, start=start, end=end, min_quantity=min_quantity)
        ResultSet = connection.execute(q).fetchall()

        print("Data = ", ResultSet)
        data = {
            'tableData': [
                { "name": el[0] } for el in ResultSet
            ],
        }
        js = json.dumps(data)
        resp = Response(js, status=200, mimetype='application/json')
        resp.headers['Access-Control-Allow-Origin'] = '*'

        return resp

@app.route('/author-role/2')
def author_role_2():
    min_quantity = request.args['min_quantity']
    start = request.args['start']
    end = request.args['end']

    print(min_quantity, start, end)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select3"].format(start=start, end=end, min_quantity=min_quantity)
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
            { "name": el[0] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/author-role/3')
def author_role_3():
    author = request.args['author']
    start = request.args['start']
    end = request.args['end']

    print(author, start, end)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select6"].format(start=start, end=end, author=author)
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
            { "id": el[0] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/author-role/4')
def author_role_4():
    author = request.args['author']
    customer = request.args['customer']
    start = request.args['start']
    end = request.args['end']

    print(author, customer, start, end)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select8"].format(author=author, start=start, end=end, customer=customer)
        ResultSet = connection.execute(q).fetchall()
        print(ResultSet)
    data = {
        'tableData': [
            
                { "postID": el[0], "tokenID": el[1], "tokenID2": el[2] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/author-role/5')
def author_role_5():
    author = request.args['author']
    min_quantity = request.args['min_quantity']
    start = request.args['start']
    end = request.args['end']

    print(author, min_quantity, start, end)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select9"].format(author=author, start=start, end=end, min_quantity=min_quantity)
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
               { "name": el[0], "articleID": el[1] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/author-role/6')
def author_role_6():
    month = request.args['month']

    print(month)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select11"].format(month=month)
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
            { "count": el[0], "month": str(el[1]) } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/customer-role/1')
def customer_role_1():
    customer = request.args['customer']
    start = request.args['start']
    end = request.args['end']

    print(customer, start, end)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select2"].format(customer=customer, start=start, end=end)
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
            { "name": el[0] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/customer-role/2')
def customer_role_2():
    min_quantity = request.args['min_quantity']
    start = request.args['start']
    end = request.args['end']

    print(min_quantity, start, end)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select4"].format(start=start, end=end, min_quantity=min_quantity)
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
            { "name": el[0] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/customer-role/3')
def customer_role_3():
    customer_id = request.args['customer']
    min_quantity = request.args['min_quantity']
    start = request.args['start']
    end = request.args['end']

    print(customer_id, min_quantity, start, end)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select5"].format(customer_id=customer_id, start=start, end=end, min_quantity=min_quantity)
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
            { "networkID": el[0], "name": el[1], "ordersCount": el[2] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/customer-role/4')
def customer_role_4():
    customer = request.args['customer']

    print(customer)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select7"].format(customer=customer)
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
            { "name": el[0] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/customer-role/5')
def customer_role_5():
    customer = request.args['customer']
    author = request.args['author']
    start = request.args['start']
    end = request.args['end']

    print(customer, author, start, end)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select8"].format(author=author, start=start, end=end, customer=customer)
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
            { "postID": el[0], "tokenID": el[1], "tokenID2": el[2] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/customer-role/6')
def customer_role_6():
    customer = request.args['customer']
    start = request.args['start']
    end = request.args['end']

    print(customer, start, end)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select10"].format(customer=customer, start=start, end=end)
        ResultSet = connection.execute(q).fetchall()
        print("DAta = ", ResultSet)
    data = {
        'tableData': [
                { "styleName": el[0], "count": el[1] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/social-media-role/1')
def social_media_role_1():
    author = request.args['author']
    start = request.args['start']
    end = request.args['end']

    print(author, start, end)

    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select12"].format(author=author, start=start, end=end)
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
            { "name": el[0] } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/additional')
def additional():
    with Database.engine.connect() as connection:
        q = d.dict_of_selects["select13"]
        ResultSet = connection.execute(q).fetchall()
    data = {
        'tableData': [
            { "start_date": str(el[1]), "author_id": str(el[2]), "amount": str(el[3]) + "%",  } for el in ResultSet
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp


if __name__ == '__main__':
    d = Database()
    app.run()
    d.drop_database()