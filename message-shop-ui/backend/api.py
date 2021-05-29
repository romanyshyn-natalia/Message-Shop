import json
import time
from flask import Flask, request, Response
app = Flask(__name__)


@app.route('/author-role/1')
def author_role_1():
    author = request.args['author']
    min_quantity = request.args['min_quantity']
    start = request.args['start']
    end = request.args['end']

    print(author, min_quantity, start, end)

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a1',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
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

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a2',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/author-role/3')
def author_role_3():
    start = request.args['start']
    end = request.args['end']

    print(start, end)

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a3',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
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

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a4',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
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

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a5',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
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

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a6',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
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

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a1 cust',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
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

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a2 cust',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

@app.route('/customer-role/3')
def customer_role_3():
    customer = request.args['customer']
    min_quantity = request.args['min_quantity']
    start = request.args['start']
    end = request.args['end']

    print(customer, min_quantity, start, end)

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a3 cust',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
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

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a4 cust',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
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

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a5 cust',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
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

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a6 cust',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
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

    data = {
        'tableData': [
            {
            'title1aaa': 'aa1a1 social media',
            'title2aaa': 'bb1a',
            },
            {
            'title1aaa': 'aa2a',
            'title2aaa': 'bb2a',
            },
        ],
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    resp.headers['Access-Control-Allow-Origin'] = '*'

    return resp

if __name__ == '__main__':
    app.run()