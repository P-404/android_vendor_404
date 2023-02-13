import os
import datetime

Changelog = "Changelog.txt"
device = os.environ.get('TARGET_PRODUCT', '').replace('p404_', '')
out_dir = os.environ.get('OUT_DIR', './out')

if os.path.isfile(Changelog):
    os.remove(Changelog)

with open(Changelog, 'w') as f:
    for i in range(5):
        after_date = (datetime.datetime.now() - datetime.timedelta(days=i)).strftime('%m-%d-%Y')
        until_date = (datetime.datetime.now() - datetime.timedelta(days=i-1)).strftime('%m-%d-%Y')
        f.write(f'================\n')
        f.write(f'{until_date}\n')
        f.write(f'================\n')

        with open('.repo/project.list') as projects:
            for path in projects:
                path = path.strip()
                clog = os.popen(f'git --git-dir ./{path}/.git log --oneline --after={after_date} --until={until_date} --pretty=tformat:"%h  %s  [%an]" --abbrev-commit --abbrev=7').read()
                if clog:
                    f.write(f'\n* {path}\n{clog}\n')
        f.write('\n')

os.popen(f'sed -i "s/project/   */g" {Changelog}')
os.popen(f'cp {Changelog} {out_dir}/target/product/{device}/system/etc/')
os.popen(f'cp {Changelog} {out_dir}/target/product/{device}/')
print(f"Changelog file path: {os.path.abspath(Changelog)}")
