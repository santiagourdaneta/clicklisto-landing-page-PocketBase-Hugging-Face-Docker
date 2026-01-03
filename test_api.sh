# Probar que la API responde rápido
curl -w "Tiempo total: %{time_total}s\n" -o /dev/null -s http://127.0.0.1:8090/api/collections/landing_info/records