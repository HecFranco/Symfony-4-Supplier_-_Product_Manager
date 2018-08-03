export default {
    custom: {
        firstname: {
            alpha: 'El nombre debe usar caracteres',
            required: 'El nombre es requerido',
        },        
        lastname: {
            alpha: 'El apellido debe usar caracteres',
            required: 'El nombre es requerido',
        },
        email: {
            required: 'El correo electrónico es requerido',
            email: 'El correo electrónico no es válido'
        },
        username: {
            required: 'El nombre de usuario es requerido',
        },
        password: {
            required: 'La contraseña es requerida',
            min: 'La contraseña es demasiado corta',
        },
        password_confirmation: {
            required: 'La contraseña es requerida',
            min: 'La contraseña es demasiado corta',
            confirmed: 'La contraseña no coincide'
        },
    }
}