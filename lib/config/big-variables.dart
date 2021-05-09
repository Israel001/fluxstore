List<Map> addressTextFields = [
  {
    'label': 'Full Name',
    'validator': (String val) {
      if (val.isEmpty) {
        return 'This field cannot be blank';
      } else if (val.trim().length < 3) {
        return 'Full name is too short';
      } else if (val.trim().length > 30) {
        return 'Full name is too long';
      } else if (!RegExp(r'^[a-zA-Z\s]{0,30}$').hasMatch(val)) {
        return 'Full name must contain alphabets only';
      }
    },
    'value': '',
    'id': 'fullName'
  },
  {
    'label': 'Phone Number',
    'validator': (String val) {
      if (val.isEmpty) {
        return 'This field cannot be blank';
      } else if (!RegExp(r'[+0-9]').hasMatch(val)) {
        return 'Invalid phone number';
      }
    },
    'value': '',
    'id': 'phoneNumber'
  },
  {
    'label': 'Email Address',
    'validator': (String val) {
      if (val.isEmpty) {
        return 'This field cannot be blank';
      } else if (!RegExp(
              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)"
              r"*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*["
              r"a-z0-9])?")
          .hasMatch(val)) {
        return 'Invalid email address';
      }
    },
    'value': '',
    'id': 'emailAddress'
  },
  {
    'label': 'Country',
    'validator': (String val) {
      if (val.isEmpty) {
        return 'This field cannot be blank';
      }
    },
    'value': '',
    'id': 'country'
  },
  {
    'label': 'City',
    'validator': (String val) {
      if (val.isEmpty) {
        return 'This field cannot be blank';
      }
    },
    'value': '',
    'id': 'city'
  },
  {
    'label': 'Address',
    'validator': (String val) {
      if (val.isEmpty) {
        return 'This field cannot be blank';
      }
    },
    'value': '',
    'id': 'address'
  },
  {
    'label': 'Zip Code',
    'validator': (String val) {
      if (val.isEmpty) {
        return 'This field cannot be blank';
      } else if (!RegExp(r'^\d{5}(?:[-\s]\d{4})?$').hasMatch(val)) {
        return 'Invalid zip code';
      }
    },
    'value': '',
    'id': 'zipCode'
  }
];

List cartItems = [
  {
    "image": "assets/prod-img.jpeg",
    "name": "T-Shirt with Next Stop",
    "price": 60.00,
    "quantity": 1,
    "maxQuantity": 10
  }
];
