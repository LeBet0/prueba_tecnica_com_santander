<?php ?>
    <!DOCTYPE html>
    <html lang="es">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Prueba Técnica</title>
        <!-- <link rel="stylesheet" href="style.css"> -->
      </head>
      <script>
        function mostrar_informe_1() {
          fetch('../BACK/ENDPOINTS/stock.php'/* , {
                method: 'POST',                            
                body: formData
            } */
          )
            .then(response => response.text())
            .then(data => {                                        
                document.getElementById("top-5-clientes").innerHTML = data; // Verificación exitosa
                    // Realiza cualquier acción necesaria aquí
                    /* else {
                    console.error(data.message); // Error en la verificación
                } */
            })
            .catch(error => {
                console.error("Error:", error);
            });
        };

        function mostrar_informe_2(){
          fetch('../BACK/ENDPOINTS/stock.php'/* , {
                method: 'POST',                            
                body: formData
            } */
          )
            .then(response => response.text())
            .then(data => {                                        
                document.getElementById("top-5-clientes").innerHTML = data; // Verificación exitosa
                    // Realiza cualquier acción necesaria aquí
                    /* else {
                    console.error(data.message); // Error en la verificación
                } */
            })
            .catch(error => {
                console.error("Error:", error);
            });
        };

      </script>
      <body>
        <section>
          <h1>Prueba Técnica</h1>
          <div>
            <span id='respuesta'></span>
          </div>
          <div class="container">
          <div class="row">
            <div><h3></h3>
              <table>
                <thead>Informe #1 - Clasificación de los primeros 5 clientes con más compras en el mes. </thead>
                <tr>
                  <td><button type="button" onclick = "mostrar_informe_1()">Generar informe</button></td>
                </tr>
                <tr id='top-5-clientes'>

                </tr>
              </table>
            </div>
            <div><h3></h3>
              <table>
                <thead>Informe #2 - Clasificación primeros 5 productos más vendidos en el mes.</thead>
                <tr>
                  <td><button type="button">Generar informe</button></td>
                </tr>
                <tr id='top-5-productos'>

                </tr>
              </table>
            </div>
            <div><h3></h3>
              <table>
                <thead>Informe #3 - Valor total por producto y por cliente comprados en un rango de fechas</thead>
                <tr>
                  <td><button type="button">Generar informe</button></td>
                </tr>
                <tr id='total-producto-cliente'>

                </tr>
              </table>
            </div>
          </div>
          </div>
          
          
        </section>

      </body>
    </html>
<?php ?>