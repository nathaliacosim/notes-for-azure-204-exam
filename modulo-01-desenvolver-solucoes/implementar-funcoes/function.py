import logging
import azure.functions as func
 
def main(req: func.HttpRequest) -> func.HttpResponse:
    name = req.params.get('name')
    if not name:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('name')
 
    if name:
        return func.HttpResponse(f"Olá, {name}.", status_code=200)
    else:
        return func.HttpResponse(
             "Por favor, passe um nome na query string ou no corpo JSON.",
             status_code=400
        )