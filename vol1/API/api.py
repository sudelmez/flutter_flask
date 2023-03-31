from flask import Flask
from flask import request
app = Flask(__name__)

@app.route('/api',methods= ['GET'])
def returnascii():
    d ={}
    inputchr = str(request.args['query'])
    answer = str(ord(inputchr))
    d['output'] = answer
    return d

if(__name__ == "__main__"):
    app.debug = True
    app.run()

# http://127.0.0.1:5000, when we search for this api, it shows an error but if
# we type http://127.0.0.1:5000/api?query=a , we become specified the requested 
# character and it works properly.    