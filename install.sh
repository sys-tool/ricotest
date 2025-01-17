#!/bin/sh
skip=44

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

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�M�_install.sh ���o�0���+�NC�T����J�c�֪G��QnL�8�4!!!mG.�_C�n��I���c\�g��{��c{p�� 9u34X�������WG���CZB��~��>~�\I�ƕU	�:�ۅ������� ��Qa�K�jjɷ���\9[�;�ta^��9��=f<|�b*<�Oa�}��t���Ϫ�r�2SxQx̌&�����pox�XɌ�M��p��¦AT'p�r"X�������ݍ)�����W�d9M ��	<B�f���QBn/���v"����Ƒ\,��cuG�������6�X�%���� �Ɉ��ܥ �P2ml�L�G��5�
DAsu���^k�]s^��t��JP'\X_�PN2�=�Y�z:�
�E�:��� ��%�0����Y��Lw_�&�ٽ����g�!�#Q`eެ*�i`�/Ѭ�I������&��W\���7�!�����n��t�ߵ���  