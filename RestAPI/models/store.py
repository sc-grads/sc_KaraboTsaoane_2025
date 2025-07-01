from db import db #To get instance of SQLAlchemy to your DB

class StoreModel(db.Model): #Takes data from db.model
    __tablename__ = "stores"  #we want to use Table Items for this class
#These are cloumns
    id = db.Column(db.Integer , primary_key = True)
    name =  db.Column(db.String(80) , unique= True , nullable =False)
    items =db.relationship("ItemModel" , back_populates = "store" , lazy = "dynamic")



     
