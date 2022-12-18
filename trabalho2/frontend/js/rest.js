/**
 *  Tratador de evenvos para uma API Rest
 *
 *  @see
 * https://dev.to/simonplend/how-to-use-fetch-to-post-form-data-as-json-to-your-api-2pih
 */


async function enviarDados(evento, callback) {
  /* O trecho a seguir inibe o comportamento default do browser
     de submeter imediatamente o formulário.                        */
  evento.preventDefault();

  /* Obtém o formulário ao qual o evento está associado.            */
  const formulario = evento.currentTarget;

  /* Obtém a URL da API a partir do atributo `action`.              */
  const url = formulario.action;


  try {
    /* Pega todos os campos do formulário e faz com que seus valores
       fiquem disponíveis via uma instância de `FormData`.
       @see https://developer.mozilla.org/en-US/docs/Web/API/FormData
    */
    const formData = new FormData(formulário);

    /* Envia os dados no formato JSON via POST para a URL informada. */
    const dadosResposta = await enviaFormDataComoJson(url, formData);

    /* Assim que os dados do servidor chegarem, a função callback será
       chamada. */
    callback(dadosResposta);

  } catch (erro) {
    console.error(erro);
  }
}


/**
 *  Função auxiliar para postar dados no formato JSON usando fetch
 *
 * @param {string} url - URL para onde postar os dados
 * @param {FormData} formData- uma instância de FormData
 * @return {Object} - corpo da resposta devolvida pela URL
 */
async function enviaFormDataComoJson(url, formData) {

  const formDataSimples = Object.fromEntries(formData.entries());

  let metodo = 'POST';

  if (typeof formDataSimples._metodo !== 'undefined') {
    metodo = formDataSimples._metodo;
    delete formDataSimples._metodo;
  };


  console.log('metodo = ', metodo);

  const stringJson = JSON.stringify(formDataSimples);

  console.log('json = ', stringJson);

  const opçõesFetch = {
    method: metodo,

    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },

    /* O Corpo do pedido é a string JSON criada acima.         */
    body: stringJson,
  };

  const resposta = await fetch(url, opçõesFetch);

  if (!resposta.ok) {
    const errorMessage = await resposta.text();
    throw new Error(errorMessage);
  }

  return resposta.json();
}


async function remover(url, callback){
  const opçõesFetch = {
    method: 'DELETE',

    /* Estes cabeçalhos serão adicionados ao pedido e informarão
       à API que o corpo do pedido é um JSON e que aceita-se
       JSON como resposta.
     */
    headers: {
      "Content-Type": "application/json"
    },

  };

  const resposta = await fetch(url, opçõesFetch);

  if (!resposta.ok) {
    const errorMessage = await resposta.text();
    throw new Error(errorMessage);
  }

  callback(resposta);
}