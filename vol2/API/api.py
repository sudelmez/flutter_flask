from flask import Flask, jsonify
from flask import request
import json
app = Flask(__name__)

response=''
@app.route('/name',methods= ['GET','POST'])

def namewrite():

    global response
    if(request.method=='POST'):
        request_data= request.data
        request_data = json.loads(request_data.decode('utf-8'))
        name = request_data['name']
        response = f'Hi {name}! Welcome!'
        return " "
    else: 
        return jsonify({'name':response})    


if(__name__ == "__main__"):
    app.debug = True
    app.run()