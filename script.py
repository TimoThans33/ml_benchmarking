import cmind

output=cmind.access({'action':'run', 'automation':'script',
                     'tags':'python,app,image-classification,onnx',
                     'input':'computer_mouse.jpg'})

if output['return']==0: print (output)
else: print ('Error:', output['error'])