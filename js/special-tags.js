function a() {
    () => {
        console.log('que?');
        document.getElementsByTagName('concept').forEach(elm => {
            console.log('yay');
            console.log(elm);
        });
    }
}

document.addEventListener('DOMContentLoaded', a);
window.onload = a;

alert('yay');
