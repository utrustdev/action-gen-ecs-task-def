#!/usr/bin/env python2
"""
Parses a python template file using a given JSON dictionary
"""

from string import Template
import json
import sys
import getopt

def usage():
    print('''
    Usage:
        bin/deploy/generate_task_definition \\
            --dictionary secrets.json \\
            --template task_definition.json \\
            -a GIT_HASH=$CIRCLECI_SHA1 \\
            -a DOCKER_IMAGE=xxx
    ''')

def parse_args(args):
    opts, _args = getopt.getopt(args, 'a:', ['dictionary=', 'template='])

    template=""
    dictionary={}
    for opt, arg in opts:
        if opt == "--template":
            template=arg
        if opt == "--dictionary":
            dictionary_file = json.loads(open(arg).read())
            dictionary.update(dictionary_file)
        if opt == "-a":
            key, val = arg.split("=")
            dictionary[key] = val

    if not template or not dictionary:
        usage()
        raise SystemExit

    return template, dictionary

def main(args):
    template_file, dictionary = parse_args(args)

    template = Template(open(template_file).read())

    try:
        print(template.substitute(dictionary))
    except KeyError as e:
        sys.stderr.write("Error: Key " + e.args[0] + " not set")
        sys.exit(1)

if __name__ == "__main__":
    main(sys.argv[1:])
