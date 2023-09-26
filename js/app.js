console.log('Desde app.js')

async function loadDataFromServer(){

    const issues = await fetch('http://localhost:8080/Desafio2.php')
        .catch(err => console.log('Solicitud fallida', err)) // Capturar errores
    
    const data = await issues.json()

    generateTableElement( data )

}

function generateTableElement( issues ) {

    let tableBody = document.getElementById( 'issues' )

    tableBody.innerHTML = ""

    issues.forEach( issue => {
       
       const rowElement = document.createElement( 'tr' )
       for (const [key, value] of Object.entries( issue ) ) {

            let cellElement = document.createElement( 'td' )
            cellElement.textContent = value
            rowElement.appendChild( cellElement )

      }

      tableBody.appendChild( rowElement );

    });
}

loadDataFromServer();
