from flask import Flask, request, jsonify

app = Flask(__name__)

# In-memory data for now
contacts = []
contact_id = 1

@app.route('/')
def home():
    return "Welcome to Contact Book API!"

@app.route('/contacts', methods=['GET'])
def get_contacts():
    return jsonify(contacts)

@app.route('/contacts', methods=['POST'])
def add_contact():
    global contact_id
    data = request.get_json()
    contact = {
        'id': contact_id,
        'name': data['name'],
        'email': data['email'],
        'phone': data['phone']
    }
    contacts.append(contact)
    contact_id += 1
    return jsonify(contact), 201

@app.route('/contacts/<int:id>', methods=['PUT'])
def update_contact(id):
    data = request.get_json()
    for contact in contacts:
        if contact['id'] == id:
            contact.update(data)
            return jsonify(contact)
    return jsonify({'error': 'Contact not found'}), 404

@app.route('/contacts/<int:id>', methods=['DELETE'])
def delete_contact(id):
    global contacts
    contacts = [c for c in contacts if c['id'] != id]
    return jsonify({'message': 'Deleted'}), 204

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
