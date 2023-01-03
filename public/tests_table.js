const fragment = new DocumentFragment();
const url = 'http://localhost:3000/tests';

fetch(url)
    .then((response) => response.json())
    .then((data) => {
        data.forEach(function(test) {
          const tr = document.createElement('tr');

          const td1 = document.createElement('td');
          td1.textContent = `${test.test_token}`;
          tr.appendChild(td1);

          const td2 = document.createElement('td');
          td2.textContent = `${test.patient_name}`;
          tr.appendChild(td2);

          const td3 = document.createElement('td');
          td3.textContent = `${test.patient_registration_number}`;
          tr.appendChild(td3);

          const td4 = document.createElement('td');
          td4.textContent = `${test.patient_birth_date}`;
          tr.appendChild(td4);

          const td5 = document.createElement('td');
          td5.textContent = `${test.doctor_crm}/${test.doctor_crm_state}`;
          tr.appendChild(td5);

          const td6 = document.createElement('td');
          td6.textContent = `${test.doctor_name}`;
          tr.appendChild(td6);

          const td7 = document.createElement('td');
          td7.textContent = `${test.test_type}`;
          tr.appendChild(td7);

          const td8 = document.createElement('td');
          td8.textContent = `${test.test_date}`;
          tr.appendChild(td8);

          const td9 = document.createElement('td');
          td9.textContent = `${test.test_limits}`;
          tr.appendChild(td9);

          const td0 = document.createElement('td');
          td0.textContent = `${test.test_result}`;
          tr.appendChild(td0);
          
          fragment.appendChild(tr);
        })
    })
    .then(() => {
        document.getElementById("tests").appendChild(fragment);
    })
    .catch(function(error) {
        console.log(error);
    });