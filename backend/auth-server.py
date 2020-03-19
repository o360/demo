import http.server
import socketserver
import csv
import json
from dataclasses import dataclass


@dataclass
class User:
    id: str
    email: str
    password: str
    first_name: str
    last_name: str
    gender: str


class Handler(http.server.SimpleHTTPRequestHandler):
    def do_POST(self):
        body = self.rfile.read(int(self.headers['Content-Length']))
        body = json.loads(body)
        response = None

        users = []
        with open('users.csv') as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            next(csv_reader) # skip header
            for row in csv_reader:
                user = User(
                    id=row[0],
                    email=row[1],
                    password=row[2],
                    first_name=row[3],
                    last_name=row[4],
                    gender=row[5]
                )
            users.append(user)


        for user in users:
            if body['username'] == user.email and body[
                    'password'] == user.password:
                response = {
                    'userId': user.id,
                    'firstName': user.first_name,
                    'lastName': user.last_name,
                    'email': user.email,
                    'gender': user.gender
                }
                break

        if response:
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            body = json.dumps(response).encode()
            self.send_header('Content-Length', len(body))
            self.end_headers()
            self.wfile.write(body)
        else:
            self.send_response(401)
            self.end_headers()
        return


httpd = socketserver.TCPServer(('', 9090), Handler)
print('Started server on port 9090')
httpd.serve_forever()
