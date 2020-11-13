# Tarantool key-value store
 
## API
Path | Method | Body (JSON) | Description
--- | --- | --- | --- 
/kv/:key | GET |  | Obtain a value by key and return it
/kv | POST | ```{"key": "Your key", "value": "Some Arbitrary JSON"} ``` | Add a new key-value pair if the key is not in the database
/kv/:key | PUT | ```{ "value": "Some Arbitrary JSON"} ``` | Update new pair if the key was in the database
/kv/:key | DELETE | | Delete key-value pair if the key is in the database
/kv | GET |  | Return all key-value pairs in database