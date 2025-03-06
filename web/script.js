const toggle = document.getElementById('theme-switch');
const darkModeStyle = document.getElementById('dark-mode-style');

toggle.addEventListener('change', () => {
    if (toggle.checked) {
        document.body.classList.add('dark-mode');
        darkModeStyle.disabled = false; // Habilita o CSS do modo escuro
    } else {
        document.body.classList.remove('dark-mode');
        darkModeStyle.disabled = true; // Desabilita o CSS do modo escuro
    }
});

