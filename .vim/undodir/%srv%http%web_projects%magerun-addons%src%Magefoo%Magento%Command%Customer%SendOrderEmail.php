Vim�UnDo� �rY$c�H�����@�����(iO�,ѻ�3   g   -                ->addFieldToFilter('status');   %   +   #   $       $   $   $    Y�@�    _�       $          #   $   8    ����                                                                                                                                                                                                                                                                                                                            #          &   .       v   .    Y�@�     �   #   &   f      9                ->addFieldToFilter('status', 'complete');5�_�   #               $   %   +    ����                                                                                                                                                                                                                                                                                                                            #          '   .       v   .    Y�@�    �   $   &   g      -                ->addFieldToFilter('status');5�_�              #      /       ����                                                                                                                                                                                                                                                                                                                                                             Y�8�     �   .   /   f                      �   .   0   g                      $5�_�                    #   I    ����                                                                                                                                                                                                                                                                                                                            #          &   .       v   .    Y�8�     �   "   $   g      J            $collection = \Mage::getModel('sales/order')->getCollection();5�_�                    $       ����                                                                                                                                                                                                                                                                                                                            #          &   .       v   .    Y�8�     �   #   %   g      @            $collection->addFieldToFilter('status', 'complete');5�_�                    $       ����                                                                                                                                                                                                                                                                                                                            %          %          v       Y�8�     �   #   %   g      M            $completed = $collection->addFieldToFilter('status', 'complete');5�_�                    %       ����                                                                                                                                                                                                                                                                                                                            %          %          v       Y�8�     �   $   &   g      @            $c->getSelect()->order(new \Zend_Db_Expr('RAND()'));5�_�                    %       ����                                                                                                                                                                                                                                                                                                                            &          &          v       Y�8�     �   $   &   g      H            $completed->getSelect()->order(new \Zend_Db_Expr('RAND()'));5�_�                    &       ����                                                                                                                                                                                                                                                                                                                            &          &          v       Y�8�     �   %   '   g      &            $c->getSelect()->limit(1);5�_�      	              &       ����                                                                                                                                                                                                                                                                                                                            *          *          v       Y�8�     �   %   '   g      .            $completed->getSelect()->limit(1);5�_�      
           	   *       ����                                                                                                                                                                                                                                                                                                                            *          *          v       Y�8�     �   )   +   g      #            foreach($c as $value) {5�_�   	              
   *       ����                                                                                                                                                                                                                                                                                                                            *   #       *   %       v   %    Y�8�     �   )   +   g      +            foreach($completed as $value) {5�_�   
                 /       ����                                                                                                                                                                                                                                                                                                                            *   #       *   %       v   %    Y�9     �   .   0   g      B                $pending = $collection->addFieldToFilter('status')5�_�                    /   A    ����                                                                                                                                                                                                                                                                                                                            *   #       *   %       v   %    Y�9     �   .   0   g      M                $pending = $collection->addFieldToFilter('status', 'pending')5�_�                    /   M    ����                                                                                                                                                                                                                                                                                                                            *   #       *   %       v   %    Y�9     �   .   0   g      N                $pending = $collection->addFieldToFilter('status', 'pending');   %                $pending->getSelect()5�_�                    0   %    ����                                                                                                                                                                                                                                                                                                                            *   #       *   %       v   %    Y�9%     �   /   1   h      I                $pending->getSelect()->order(new \Zend_Db_Expr('RAND()'))5�_�                    0   I    ����                                                                                                                                                                                                                                                                                                                            *   #       *   %       v   %    Y�97     �   /   1   h      J                $pending->getSelect()->order(new \Zend_Db_Expr('RAND()'));   %                $pending->getSelect()5�_�                    1   %    ����                                                                                                                                                                                                                                                                                                                            *   #       *   %       v   %    Y�9E     �   0   2   i      /                $pending->getSelect()->limit(1)5�_�                    1   /    ����                                                                                                                                                                                                                                                                                                                            *   #       *   %       v   %    Y�9I     �   0   2   i      0                $pending->getSelect()->limit(1);       +                foreach($pending as $value)5�_�                    3   +    ����                                                                                                                                                                                                                                                                                                                            6          7          v       Y�9c     �   2   4   k      -                foreach($pending as $value) {                   }�   3   4   l                          �   3   5   m      $                    $order = $value;5�_�                    6       ����                                                                                                                                                                                                                                                                                                                            6          6   '       v       Y�9v     �   5   8   m                      5�_�                    7       ����                                                                                                                                                                                                                                                                                                                            6          6   '       v       Y�9z     �   7   8   l                  �   7   9   m                      if(empty($order))5�_�                   9       ����                                                                                                                                                                                                                                                                                                                            6          6   '       v       Y�9�     �   8   :   n                  if(empty($order)){               }�   9   :   o       5�_�                    :        ����                                                                                                                                                                                                                                                                                                                            6          6   '       v       Y�9�     �   :   ;   p    �   9   ;   p      )echo "No orders completed. exiting...\n";                   exit(1);5�_�                    :        ����                                                                                                                                                                                                                                                                                                                            6          6   '       v       Y�9�     �   9   ;   q      -    echo "No orders completed. exiting...\n";5�_�                    :       ����                                                                                                                                                                                                                                                                                                                            6          6   '       v       Y�9�     �   9   ;   q      1        echo "No orders completed. exiting...\n";5�_�                    :       ����                                                                                                                                                                                                                                                                                                                            6          6   '       v       Y�9�     �   9   ;   q      5            echo "No orders completed. exiting...\n";5�_�                    :       ����                                                                                                                                                                                                                                                                                                                            6          6   '       v       Y�9�     �   9   ;   q      9                echo "No orders completed. exiting...\n";5�_�                    9       ����                                                                                                                                                                                                                                                                                                                            .          7          v       Y�9�    �   8   :   q                  if(empty($order)) {5�_�                    $   $    ����                                                                                                                                                                                                                                                                                                                                                             Y�?Z     �   #   %   q      $            $completed = $collection   9                ->addFieldToFilter('status', 'complete');5�_�                    %   8    ����                                                                                                                                                                                                                                                                                                                                                             Y�?_     �   $   &   r      8                ->addFieldToFilter('status', 'complete')   -                ->addFieldToFilter('status');5�_�                     &   +    ����                                                                                                                                                                                                                                                                                                                                                             Y�?m     �   %   '   s      8                ->addFieldToFilter('status', 'pending');5�_�      !               0       ����                                                                                                                                                                                                                                                                                                                            0          0          v       Y�?{     �   /   :   s                  5�_�       "           !   0       ����                                                                                                                                                                                                                                                                                                                            0          0          v       Y�?|     �   /   1        5�_�   !               "   0        ����                                                                                                                                                                                                                                                                                                                                                             Y�?|    �   /   1        5�_�                    9       ����                                                                                                                                                                                                                                                                                                                            6          6   '       v       Y�9�     �   8   :   n                  if(empty($order)) {               }�   9   :   o                      �   9   ;   p      o                cd ~/.n98-magerun/modules/ && git clone https://github.com/djfordz/magerun-addons.git df-addons5��