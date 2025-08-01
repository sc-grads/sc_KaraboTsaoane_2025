import uuid       
from flask import request
from flask.views import MethodView
from flask_smorest import Blueprint , abort #Blueprint divides Api into multiple segments
from sqlalchemy.exc import SQLAlchemyError

#from db import items
from models import ItemModel
from schemas import ItemSchema , ItemUpdatedSchema

blp = Blueprint("Items", __name__ , description= "Operations on items")

@blp.route("/item/<string:item_id>")
class Item(MethodView):
    @blp.response(200 , ItemSchema)
    def get(self , item_id):
        item = ItemModel.query.get_or_404(item_id)
        return item

    
    def delete(self ,item_id):
        item =ItemModel.query.get_or_404(item_id)
        raise NotImplementedError("Deleting an item is nit implemented")

    @blp.arguments(ItemUpdatedSchema)
    @blp.response(200 , ItemSchema)
    def put(self,item_data, item_id):  # ✅ now correctly part of the class
       item =ItemModel.query.get_or_404(item_id)
       raise NotImplementedError("Updating an item is nit implemented")

@blp.route("/item")
class ItemList(MethodView):
    @blp.response(200 , ItemSchema(many= True))
    def get(self):
        return items.values()

    @blp.arguments(ItemSchema)
    @blp.response(201, ItemSchema)
    def post(self , item_data):
        item = ItemModel(**item_data)

        try:
            db.session.add(item)     #This is how you add things to your database
            db.session.commit()
        except SQLAlchemyError:
            abort(500, message="An error occurred while inserting the item.")

        return item 