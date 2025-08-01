from db import db #To get instance of SQLAlchemy to your DB

class ItemModel(db.Model): #Takes data from db.model
    __tablename__ = "items"  #we want to use Table Items for this class
#These are cloumns
    id = db.Column(db.Integer , primary_key = True)
    name =  db.Column(db.String(80) , unique= True , nullable =False)
    price =  db.Column(db.Float(precision = 2) , unique= False , nullable =False)
    store_id =  db.Column(db.Integer, db.ForeignKey("stores.id") , unique=False, nullable =False)
    store =db.relationship("StoreModel" , back_populates = "items")
#db.relationship("StoreModel"):
#Connects this model to the StoreModel — like saying:
#“Each item belongs to one store.”
     
