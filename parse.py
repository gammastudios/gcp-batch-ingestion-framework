import yaml

with open("env-config.yaml", 'r') as stream:
    try:
        data = yaml.safe_load(stream)
        for k, v in data["clusters"].items():
            print(data["clusters"][k]["tag_cl"])

    except yaml.YAMLError as exc:
        print(exc)