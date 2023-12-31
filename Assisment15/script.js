
const inp_field = {
  username: /^[a-z\d]{5,12}$/i,
  email: /^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,8})(\.[a-z]{2,8})?$/,
  password: /^[#\w@_-]{8,20}$/,
  phone_no:/^\d{10}$/
}


const validate = (field, regex) => {
  regex.test(field.value) ? field.className = 'valid' : field.className = 'invalid';
}

let keys = document.querySelectorAll('input');
keys.forEach(item => item.addEventListener(
  'keyup', e => {
    validate(e.target, inp_field[e.target.attributes.name.value])
  }
));