FasdUAS 1.101.10   ��   ��    l      ����  i         I     �� ��
�� .GURLGURLnull��� ��� TEXT  o      ���� 0 	schemeurl 	schemeUrl��    k     �    	 
 	 l     ��  ��      Save original delimiters     �   2   S a v e   o r i g i n a l   d e l i m i t e r s 
     r         n        1    ��
�� 
txdl  1     ��
�� 
ascr  o      ���� 0 	olddelims 	oldDelims      l   ��������  ��  ��        Q    �     k   	 �       l  	 	��  ��    ' ! Extract everything after nvim://     �     B   E x t r a c t   e v e r y t h i n g   a f t e r   n v i m : / /   ! " ! r   	  # $ # J   	  % %  &�� & m   	 
 ' ' � ( (  n v i m : / /��   $ n      ) * ) 1    ��
�� 
txdl * 1    ��
�� 
ascr "  + , + Z   % - .���� - A     / 0 / l    1���� 1 I   �� 2��
�� .corecnte****       **** 2 n     3 4 3 2   ��
�� 
citm 4 o    ���� 0 	schemeurl 	schemeUrl��  ��  ��   0 m    ����  . R    !�� 5��
�� .ascrerr ****      � **** 5 m      6 6 � 7 7 $ I n v a l i d   U R L   f o r m a t��  ��  ��   ,  8 9 8 r   & . : ; : n   & , < = < 4   ) ,�� >
�� 
cobj > m   * +����  = l  & ) ?���� ? n   & ) @ A @ 2  ' )��
�� 
citm A o   & '���� 0 	schemeurl 	schemeUrl��  ��   ; o      ���� 0 fullcontent fullContent 9  B C B l  / /��������  ��  ��   C  D E D l  / /�� F G��   F > 8 Extract the file path (everything between file:/ and ?)    G � H H p   E x t r a c t   t h e   f i l e   p a t h   ( e v e r y t h i n g   b e t w e e n   f i l e : /   a n d   ? ) E  I J I r   / 6 K L K J   / 2 M M  N�� N m   / 0 O O � P P 
 f i l e /��   L n      Q R Q 1   3 5��
�� 
txdl R 1   2 3��
�� 
ascr J  S T S Z  7 K U V���� U A   7 @ W X W l  7 > Y���� Y I  7 >�� Z��
�� .corecnte****       **** Z n   7 : [ \ [ 2  8 :��
�� 
citm \ o   7 8���� 0 fullcontent fullContent��  ��  ��   X m   > ?����  V R   C G�� ]��
�� .ascrerr ****      � **** ] m   E F ^ ^ � _ _ J I n v a l i d   U R L   f o r m a t ,   m i s s i n g   f i l e   p a t h��  ��  ��   T  ` a ` r   L T b c b n   L R d e d 4   O R�� f
�� 
cobj f m   P Q����  e l  L O g���� g n   L O h i h 2  M O��
�� 
citm i o   L M���� 0 fullcontent fullContent��  ��   c o      ���� 0 pathwithquery pathWithQuery a  j k j l  U U��������  ��  ��   k  l m l l  U U�� n o��   n   Split path and query    o � p p *   S p l i t   p a t h   a n d   q u e r y m  q r q r   U \ s t s J   U X u u  v�� v m   U V w w � x x  ?��   t n      y z y 1   Y [��
�� 
txdl z 1   X Y��
�� 
ascr r  { | { r   ] e } ~ } n   ] c  �  4   ` c�� �
�� 
cobj � m   a b����  � l  ] ` ����� � n   ] ` � � � 2  ^ `��
�� 
citm � o   ] ^���� 0 pathwithquery pathWithQuery��  ��   ~ o      ���� 0 filepath filePath |  � � � l  f f��������  ��  ��   �  � � � l  f f�� � ���   � 1 + Extract tmux session from query if present    � � � � V   E x t r a c t   t m u x   s e s s i o n   f r o m   q u e r y   i f   p r e s e n t �  � � � r   f i � � � m   f g � � � � �   � o      ���� 0 tmuxsession tmuxSession �  � � � Z   j � � ����� � ?   j s � � � l  j q ����� � I  j q�� ���
�� .corecnte****       **** � n   j m � � � 2  k m��
�� 
citm � o   j k���� 0 pathwithquery pathWithQuery��  ��  ��   � m   q r����  � k   v � � �  � � � r   v ~ � � � n   v | � � � 4   y |�� �
�� 
cobj � m   z {����  � l  v y ����� � n   v y � � � 2  w y��
�� 
citm � o   v w���� 0 pathwithquery pathWithQuery��  ��   � o      ���� 0 	querypart 	queryPart �  � � � l   ��������  ��  ��   �  � � � l   �� � ���   � &   Look for tmux-session parameter    � � � � @   L o o k   f o r   t m u x - s e s s i o n   p a r a m e t e r �  � � � r    � � � � J    � � �  ��� � m    � � � � � �  t m u x - s e s s i o n =��   � n      � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr �  ��� � Z   � � � ����� � ?   � � � � � l  � � ����� � I  � ��� ���
�� .corecnte****       **** � n   � � � � � 2  � ���
�� 
citm � o   � ����� 0 	querypart 	queryPart��  ��  ��   � m   � �����  � k   � � � �  � � � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � l  � � ����� � n   � � � � � 2  � ���
�� 
citm � o   � ����� 0 	querypart 	queryPart��  ��   � o      ���� 0 tmuxsession tmuxSession �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � 2 , Handle additional query parameters (if any)    � � � � X   H a n d l e   a d d i t i o n a l   q u e r y   p a r a m e t e r s   ( i f   a n y ) �  � � � r   � � � � � J   � � � �  ��� � m   � � � � � � �  &��   � n      � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr �  ��� � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � m   � ���  � l  � � ��~�} � n   � � � � � 2  � ��|
�| 
citm � o   � ��{�{ 0 tmuxsession tmuxSession�~  �}   � o      �z�z 0 tmuxsession tmuxSession��  ��  ��  ��  ��  ��   �  � � � l  � ��y�x�w�y  �x  �w   �  � � � l  � ��v � ��v   � > 8 Pass tmux session name and file path to the bash script    � � � � p   P a s s   t m u x   s e s s i o n   n a m e   a n d   f i l e   p a t h   t o   t h e   b a s h   s c r i p t �  � � � I  � ��u ��t
�u .sysoexecTEXT���     TEXT � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � �  / b i n / b a s h   � n   � � � � � 1   � ��s
�s 
strq � m   � � � � � � � � / U s e r s / n i c o l o g n u d i / d o t f i l e s / n e o v i m _ u r l _ h a n d l e r / n v i m _ u r l _ h a n d l e r . s h � m   � �   �    � n   � � 1   � ��r
�r 
strq o   � ��q�q 0 tmuxsession tmuxSession � m   � � �    � n   � � 1   � ��p
�p 
strq o   � ��o�o 0 filepath filePath�t   � �n l  � ��m�l�k�m  �l  �k  �n    R      �j	�i
�j .ascrerr ****      � ****	 o      �h�h 0 errmsg errMsg�i    I  � ��g
�f
�g .sysodisAaleR        TEXT
 b   � � m   � � � , E r r o r   p r o c e s s i n g   U R L :   o   � ��e�e 0 errmsg errMsg�f     l  � ��d�c�b�d  �c  �b    l  � ��a�a   "  Restore original delimiters    � 8   R e s t o r e   o r i g i n a l   d e l i m i t e r s �` r   � � o   � ��_�_ 0 	olddelims 	oldDelims n      1   � ��^
�^ 
txdl 1   � ��]
�] 
ascr�`  ��  ��       �\�\   �[
�[ .GURLGURLnull��� ��� TEXT �Z �Y�X�W
�Z .GURLGURLnull��� ��� TEXT�Y 0 	schemeurl 	schemeUrl�X   �V�U�T�S�R�Q�P�O�V 0 	schemeurl 	schemeUrl�U 0 	olddelims 	oldDelims�T 0 fullcontent fullContent�S 0 pathwithquery pathWithQuery�R 0 filepath filePath�Q 0 tmuxsession tmuxSession�P 0 	querypart 	queryPart�O 0 errmsg errMsg �N�M '�L�K 6�J O ^ w � � � � ��I �H�G�F�E
�N 
ascr
�M 
txdl
�L 
citm
�K .corecnte****       ****
�J 
cobj
�I 
strq
�H .sysoexecTEXT���     TEXT�G 0 errmsg errMsg�F  
�E .sysodisAaleR        TEXT�W ���,E�O ��kv��,FO��-j l 	)j�Y hO��-�l/E�O�kv��,FO��-j l 	)j�Y hO��-�l/E�O�kv��,FO��-�k/E�O�E�O��-j k ?��-�l/E�O�kv��,FO��-j k ��-�l/E�O�kv��,FO��-�k/E�Y hY hO���,%a %��,%a %��,%j OPW X  a �%j O���,Fascr  ��ޭ