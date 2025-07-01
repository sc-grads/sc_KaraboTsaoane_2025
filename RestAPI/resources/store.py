import uuid       
from flask import request
from flask.views import MethodView
from flask_smorest import Blueprint , abort #Blueprint divides Api into multiple segments

from sqlalchemy.exc import SQLAlchemyError , IntegrityError

from db import db
from models import StoreModel
from schemas import StoreSchema
#Each blue print needs a unique name

blp = Blueprint("Stores", __name__ , description= "Operations on Stores")

@blp.route("/store/<string:store_id>")
class Store(MethodView) :
    @blp.response(200 , StoreSchema)
    def get(self , store_id):
      store = StoreModel.get_or_404(store_id)
      return store
    
    def delete(self ,store_id):
       store=StoreModel.query.get_or_404(store_id)
       raise NotImplementedError("Deleting a store is not implemented")

@blp.route("/store/<string:store_id>")
class StoreList(MethodView):
    @blp.response(201, StoreSchema)
    def get(self):
        return stores.values()

    @blp.arguments(StoreSchema)
    @blp.response(200 , StoreSchema)
    def post(self , store_data):
        store = StoreModel(**store_data)
        try:
            db.session.add(store)     #This is how you add things to your database
            db.session.commit()
        except IntegrityError:
            abort(400, message="A store with a name that already exists.")
    
       

        return store