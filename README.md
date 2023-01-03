1. Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.

git sgow aefea

aefead2207ef7e2aa5dc81a34aedf0cad4c32545, 

2. Какому тегу соответствует коммит 85024d3?

git sow 85024d3

v0.12.23

3.Сколько родителей у коммита b8d720? Напишите их хеши.

git show b8d720 - там видно что он получился в результате Merge: 56cd7859e0 9ea88f22fc
 
двое родителей 56cd7859e0 9ea88f22fc

4. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24.

git log  v0.12.23..v0.12.24  --oneline

33ff1c03bb (tag: v0.12.24) v0.12.24
b14b74c493 [Website] vmc provider links
3f235065b9 Update CHANGELOG.md
6ae64e247b registry: Fix panic when server is unreachable
5c619ca1ba website: Remove links to the getting started guide's old location
06275647e2 Update CHANGELOG.md
d5f9411f51 command: Fix bug when using terraform login on Windows
4b6d06cc5d Update CHANGELOG.md
dd01a35078 Update CHANGELOG.md
225466bc3e Cleanup after v0.12.23 release

5. Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточия перечислены аргументы).

git log -S 'func providerSource' --oneline

5af1e6234a main: Honor explicit provider_installation CLI config when present
8c928e8358 main: Consult local directories as potential mirrors of providers


6. Найдите все коммиты в которых была изменена функция globalPluginDirs.

git log -S 'globalPluginDirs' --oneline

65c4ba7363 Remove terraform binary
125eb51dc4 Remove accidentally-committed binary
22c121df86 Bump compatibility version to 1.3.0 for terraform core release (#30988)
7c7e5d8f0a Don't show data while input if sensitive
35a058fb3d main: configure credentials from the CLI config file
c0b1761096 prevent log output during init
8364383c35 Push plugin discovery down into command package

7. Кто автор функции synchronizedWriters?

git log -S 'globalPluginDirs'

 Martin Atkins
