package po;

/**
 * Layer entity. @author MyEclipse Persistence Tools
 */

public class Layer implements java.io.Serializable {

	// Fields

	private Integer layerId;
	private String layerName;
	private Long managerId;

	// Constructors

	/** default constructor */
	public Layer() {
	}

	/** full constructor */
	public Layer(String layerName, Long managerId) {
		this.layerName = layerName;
		this.managerId = managerId;
	}

	// Property accessors

	public Integer getLayerId() {
		return this.layerId;
	}

	public void setLayerId(Integer layerId) {
		this.layerId = layerId;
	}

	public String getLayerName() {
		return this.layerName;
	}

	public void setLayerName(String layerName) {
		this.layerName = layerName;
	}

	public Long getManagerId() {
		return this.managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

}