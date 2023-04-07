from flask import Flask, jsonify, request
import json

app = Flask(__name__)
datalist = []
response=[]
error = ['Daha önceden kayıtlı kullanıcı']
deleted = ['Kişi silindi']
sent = ['data sent']

@app.route('/datas',methods= ['GET','POST','DELETE'])

def data():
    global response
    if(request.method=='POST'):
        request_data= request.data
        request_data = json.loads(request_data.decode('utf-8'))
        datalist.append(request_data['list2'])
        response = datalist
        return " "
        # for i in datalist:   ???????????
        #     if(i != request_data['list2']):
        #         datalist.append(request_data['list2'])
        #         response = datalist
        #         return " "
        #     else:  
        #         return " "   

    elif(request.method == 'DELETE'):
        request_data= request.data
        request_data = json.loads(request_data.decode('utf-8'))
        datalist.remove(request_data['list2'])
        return " "
        
    else: 
        return jsonify({'list2':response, 'title': "Datas Updated"})

if(__name__ == "__main__"):
    app.debug = True
    app.run()

