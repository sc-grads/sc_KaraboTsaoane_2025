from flask import Flask , request
app = Flask(__name__)


stores = [
    {
        "name": "My Store",
        "items": [
            {
                "name": "Chair",
                "price": 15.99
            }
        ]
    }
]

@app.get("/store")   #The endpoint(/store) where to access http://127.0.0.1:5000/store
def get_stores():
    return {"stores": stores}

@app.post("/store") 
def create_store():
   request_data = request.get_json() # we are getting data from Insomnia for the post , request comes from flask so has to be added at the top
   new_store = {"name": request_data["name"], "items":[]} # name is taken from JSON file and the list is empty
   stores.append(new_store)
   return new_store , 201 #201 is the status code(Means data is accepted and will be created)

@app.post("/store/<string:name>/item") #Checks the name of the store from URL and navigates to that in JSON file to the items http://127.0.0.1:5000/store/My Store/item
def create_item(name):
     request_data = request.get_json() 
     for store in stores:
         if store["name"] == name:  #If the name exists then does the code below
             new_item ={"name": request_data["name"] , "price":request_data["price"]}#In this label store data from Json where label is []
             store["items"].append(new_item)
             return new_item , 201
     return {"message":"Store not found"} , 404 #If name of store in the URL is not found
         

@app.get("/store/<string:name>") 
def get_store(name):
    for store in stores:
         if store["name"] == name: 
             return store
    return {"message":"Store not found"} , 404

@app.get("/store/<string:name>/item") 
def get_item_in_store(name):
    for store in stores:
         if store["name"] == name: 
             return {"item": store["items"]}
    return {"message":"Store not found"} , 404