from flask import Flask, jsonify, request
import json

app = Flask(__name__)
datalist = []
response=[]
@app.route('/list',methods= ['GET','POST'])

def data():
    
    global response
    if(request.method=='POST'):
        request_data= request.data
        request_data = json.loads(request_data.decode('utf-8'))
        datalist.append(request_data['list'])
        response = datalist
        return " "
    else: 
        return jsonify({'list':response})

if(__name__ == "__main__"):
    app.debug = True
    app.run()
