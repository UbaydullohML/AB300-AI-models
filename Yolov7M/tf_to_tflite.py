import tensorflow as tf
converter = tf.lite.TFLiteConverter.from_saved_model('weights/')
tflite_model = converter.convert()

with open('weights/yolov7-tiny.tflite', 'wb') as f:
  f.write(tflite_model)