    function g = EuToG(phi1,phi,phi2)
        % Transform a orientation from [phi1, phi, phi2] (in radians) to a matrix
        
        %u=g(1,1);r=g(1,2);h=g(1,3);
        %v=g(2,1);s=g(2,2);k=g(2,3);
        %w=g(3,1);t=g(3,2);l=g(3,3);
        g = [cos(phi1)*cos(phi2)-sin(phi1)*sin(phi2)*cos(phi), sin(phi1)*cos(phi2)+cos(phi1)*sin(phi2)*cos(phi), sin(phi2)*sin(phi);
            -cos(phi1)*sin(phi2)-sin(phi1)*cos(phi2)*cos(phi), -sin(phi1)*sin(phi2)+cos(phi1)*cos(phi2)*cos(phi),cos(phi2)*sin(phi);
            sin(phi1)*sin(phi), -cos(phi1)*sin(phi), cos(phi)];
        
    end