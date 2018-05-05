from string import Template

variablesList = {}
variables = []
map = []
realm = []
realmmap = ""
realmvariables = []

model = raw_input()
while True:
    variable, type = raw_input().split(" ")
    if variable == "finish" : break
    else : variablesList[variable] = type

for variable,type in variablesList.items() :
    variables.append("\tvar " + variable + " : " + type + "?")
    map.append("\t\t" + variable + " <- map[\"" + variable + "\"]")
    realm.append("\t\t" + variable + " = realm." + variable)
    realmmap += "\"" + variable + "\" : self." + variable + "!,"
    realmvariables.append("\tdynamic var " + variable + " = " + type + "()")

realmmap = realmmap.rstrip(',')

modelfile = open(model + ".swift", 'w')
modelfile.write(Template(open('ModelTemplate.txt').read()).substitute({'model':model, 'variables':'\n'.join(variables), 'map':'\n'.join(map), 'realm':'\n'.join(realm), 'realmmap':realmmap}))
modelfile.close()

realmfile = open(model + "Realm" + ".swift", 'w')
realmfile.write(Template(open('RealmTemplate.txt').read()).substitute({'model':model,'realmvariables':'\n'.join(realmvariables)}))
realmfile.close()
