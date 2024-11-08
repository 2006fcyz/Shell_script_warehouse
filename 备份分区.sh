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
�	�%g备份分区.sh �VQoG~�WLϨ�+��V���T�ڇ>T�T)m*��-��q���N]	�Nm+���vBGŉ�:�%K6��/����B80$v*!���f��ff�{G��&�	�:x4xq�+l����x��Jz
݋���-oRW��]�C�J��Z�>�����a[)MU�;K��� *���e;�w����5�����b�#���'��4-]�|�1y����6�H�r�Yy����!>aY)3$�sss^`r���W֓�)�7�|����3z��ć<�g����"}��l\�x�!4eA*-��LP-QE1�iB��8�i����x#AT5b��#*���1����#ß���_���Zu��u�?^j>�7��7�f]4_���
x�f����+A4@G�����e�N�?���rNh����]1��f��X�B�q��R���kW�B� wmH�o��W�\����Ĳ�uķ�]ԌD��{|��Q)�N)Q�Lt���A��4F(�i쟱�
r�`�U�!`��>k+����֪%L���7�P�c�Q1C���!p��{�B`ar!�0���;����Z=	����%T�V���=�Dֱ���'C`7Ϯ���-�9v���������43�R��;TY���U��ӢK�+n?F�0�~u�\I�� ��E�̊��˷��1>Q��ҼG�&I{�X�+����(����+��;�p83�K`���)��ѱr��>?�̓6sW��ʉ
o'ֺv���l�3Y
�vIY~��� ������W�dk�v�
]va[?���%5,j����ݽ�Kwl���h����_lV�X7�p���=����`&f@��e��6E׈#r�_��+ש�ρ���m��ff����з��A�_G�����qs��y���M�Ǫ�y�z�[�^�g[4��5FQ/U�O��-����_��M~�m?Vk����/�}�&Ё  