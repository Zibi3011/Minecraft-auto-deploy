from flask import Flask, jsonify
from mcstatus import JavaServer

app = Flask(__name__)

MINECRAFT_HOST = "minecraft"
MINECRAFT_PORT = 25565

@app.route("/")
def status():
    try:
        server = JavaServer.lookup(f"{MINECRAFT_HOST}:{MINECRAFT_PORT}")
        status = server.status()

        return jsonify({
            "status": "online",
            "players_online": status.players.online,
            "players_max": status.players.max,
            "latency_ms": status.latency
        })

    except Exception as e:
        return jsonify({
            "status": "offline",
            "error": str(e)
        }), 503

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
