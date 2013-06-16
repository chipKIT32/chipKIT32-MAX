import web
import json

urls = ("/(.*)", "handleRequest")
app = web.application(urls, globals())
#app.internalerror = internalerror

#def internalerror():
#    return json.dumps({"ok":0, "errcode":500})

class handleRequest():
    def POST(self, method_id):
        indata = web.input()
        data = web.data() # you can get data use this method_id
        return

    def GET(self,method_id):
        for entry in web.ctx:
            text += entry
        return text
        #print web.ctx
        #return json.dumps({'ok': web.ctx})
        #return print web.ctx



if __name__ == "__main__":
    app.run()

