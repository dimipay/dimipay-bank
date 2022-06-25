from waitress import serve
import main #main은 flask app을 작성한 py파일입니다.
serve(main.app, host='0.0.0.0', port=5000)