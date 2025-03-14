const emptySvg = '<?xml version="1.0" encoding="utf-8"?>'
'<svg width="800px" height="800px" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">'
'<g clip-path="url(#clip0)">'
'<path d="M9.43899 42L12.6236 42C13.4525 42 14.1955 41.4887 14.4916 40.7144L16.6919 34.9607L16.7165 29.4351C16.717 29.3185 16.7278 29.2021 16.7486 29.0874L20.1529 10.2999C20.3753 9.07256 19.4323 7.9433 18.1849 7.9433L10.8634 7.94329C9.73711 7.94329 8.83296 8.8728 8.86412 9.99862L9.38638 28.8701L7.61562 32.1998C7.22342 32.9372 7.33085 33.8408 7.88504 34.4658L8.44688 35.0994L7.48367 39.5796C7.21593 40.825 8.16515 42 9.43899 42Z" stroke="#000000" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>'
'<path d="M16.7168 29.2599L9.38587 28.8701" stroke="#000000" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>'
'<path d="M38.5784 42L35.3983 42C34.5585 42 33.8082 41.4754 33.5199 40.6867L31.4266 34.9607L31.402 29.4352C31.4015 29.3185 31.3908 29.2022 31.37 29.0875L27.9654 10.2999C27.743 9.07257 28.686 7.9433 29.9334 7.9433L37.2553 7.94335C38.3815 7.94335 39.2856 8.87287 39.2545 9.99867L38.7323 28.8702L40.5032 32.1999C40.8954 32.9374 40.788 33.841 40.2337 34.4659L39.6719 35.0995L40.5423 39.622C40.7797 40.8555 39.8345 42 38.5784 42Z" stroke="#000000" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>'
'<path d="M31.4004 29.2599L38.7315 28.8702" stroke="#000000" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>'
'</g>'
'<defs>'
'<clipPath id="clip0">'
'<rect width="48" height="48" fill="white"/>'
'</clipPath>'
'</defs>'
'</svg>"';

const int primoLivelloNumero = 1; // necessariamente hardcoded, ma abbastanza scontato
const int punizioneFallimentoCombinazione = 50; //non usata
const double punizioneFallimentoCombinazionePercentuale = 0.25;
const int maxFallimenti = 3;
const String nomeCategoriaUltimiMateriali = "Ultimi materiali";