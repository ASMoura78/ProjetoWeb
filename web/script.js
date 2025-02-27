function toggleTheme() {
    document.body.classList.toggle('dark-mode');
    document.body.classList.toggle('light-mode');
    const containers = document.querySelectorAll('.cadastro-container, .login-container, .message-container, .button-container');
    containers.forEach(container => {
        container.classList.toggle('dark-mode');
        container.classList.toggle('light-mode');
    });
}





