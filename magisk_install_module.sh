#!/data/data/com.termux/files/usr/bin/bash
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/data/com.termux/files/usr/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��%gmagisk_install_module.sh �XmS����ⲁ1���$�!C�LLfP�	q24�����ڲ�U�u�P��ccS�!CKбǼ���V��z]	��kv4B�{�9�y{ι���kF�NI8�2�\��%��'��%�_H������9_��O.�?�A21uC��Z��%o�9)�%{7��Yɽ9\��)����h6���p�w|�^�LG�hb���_'##��ש���)>��Næ���&��	K�8(��u�Ni�5����mD_Ӝ�gb���)���6�>�kqK��B��-��4X�?��-}�V�i����FV���j�Um�B~�"�;�(��#�[���%��ս�3'1rR��(m���QR��)�EY�p�c"ͰE��O�:i�*�P6�-��cD��t3�8Xm��ץ�7{�෿�[[+W�W������)�j�)��{�핞�bx��p�Z٨O��;d{��;���s�`��[�f�;OH�E��:գ�:Vlj��v���B1T��6]+����e�s�2ij*R����0e,3�-g�H�����y�_=:����ֹ�{���e��_�yT;C�k�Y�G� QXY�C�0�MM�Ps���⊓H5��8�i 3yB�mX�L�Ե��~��u�a�B�݅���g�m���6��9IK�o�w�����࿡���Gԝ���%��>)�{��*��JI��
|�p��K!� m8��2��u�p,S�X�qX����א́��$�ti=�~�V����G�U+�t��0��r���4M�c闛��k�@��M�T �g.�_ۼ'�[=Z���@�y���~�	M��W�ŗ�ʆ���?����}Pݻ��Jo�8�y���f�(��#�?T��fL %n��@ l��iZ�WQ��� ����.�e6S���:�����Yzp%��A��X��B�tR��BJS*LZfZ8���.z�N=�o���1�@\m�E�7j�"O_�'3�v��[������v�0�$A^6֩��sV��v����+*�t�u�*Y����-�f+�� �A���X�;P�@g�}��e�L`��,�/� ��ݠuy
����v�!�B�x7_@�
J� qƗ���0OD��i"��Æ�-˅�1� �k���$AƼ�0_x��ރYJ����C(S=F��#��aL*���CL�"��5̰FN~y�=�z�#��9p�в�;Zv���?љ�=c��t�GE=_��zF�􅧔1��(Bi��0�Qn�������8�����(R���ՠY�q��@rw�n�w�oht��QOFW��d��XG����}��w��?��*�.p:G�_��s��ˑ���W@���jbN�ۡ�	�U�jZS��>�j0�Р�-aN�ϐV�ی �<ѹ�
��Ol��>��e�f��4`<��Z^��H�R�O����_�rP���%Y���gC������ӑ���H����+_�Q���;d�L���:=!�AC�|xd�"w����w?��0o��I���r���"v�;�?#��j��oy����K��~�u�Qu�G�)��K�V ��W������fh�P��!�iau��T�s(�����Hp�h8��	#�.�����G�vk�����BIV�[�@?L$଒���z�e���mK��g����LooE������
ͮIE�/~�hڲ�Tͩ������@E�	G�0��htR(4"���jgZ�P��t��b�t8O+�i�|��`�H�7�ı�r��i�q����T<s���Х��� 
tYz��8��mєC�x��]<j��$hh����,��+OB����*���Zy���Nk����sBC`/B#*�ZC�����}(zh��u_�?sE�U�9zBeJ��Z�$�G�|�w�3a�`?�N�xp�)��5~ք�}�:'��*;&����ne-�?�y�@  